import { z, defineCollection } from 'astro:content';
import { glob } from 'astro/loaders';

const digest = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/digest' }),
  schema: z.object({
    title: z.string(),
    date: z.string(),
    generated: z.string().optional(),
    source: z.string(),
    slug: z.string(),
  }),
});

const deepDive = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/deep-dive' }),
  schema: z.object({
    title: z.string(),
    date: z.string(),
    generated: z.string().optional(),
    source: z.string(),
    slug: z.string(),
    summary: z.string().optional(),
  }),
});

export const collections = { digest, 'deep-dive': deepDive };
